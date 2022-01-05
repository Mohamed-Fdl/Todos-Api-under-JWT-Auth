# API project with JWT Authentication
In this repo I show you how I made a little todolist API with authentication and authorization system using JWT WITH Laravel.
This API provide you your todolist and allows you to make CRUD actions according to the REST structure. So you can create,display,update and delete.
After creating account you receive token when you are logged which allow you to access your todo list 

## Database structure
### Tables
I need to store users and todos

* users
    1. name
    2. email
    3. password
* todos
    1. title
    2. content
    3. completed(boolean)


About relations there is a '__one to many__' relashionship between users and todos 

## Route API


```php
Route::group([
    'middleware'=>'api',
    'namespace' =>'App\Http\Controllers',
    'prefix' =>'auth'
],function($router){
    Route::post('register', 'AuthController@register');
    Route::post('login', 'AuthController@login')->name('login');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::get('profile', 'AuthController@profile');
    Route::post('me', 'AuthController@me');
});

Route::group([
    'middleware'=>'api',
    'namespace' =>'App\Http\Controllers',
],function($router){
    Route::resource('todos', 'TodoController');

});

```

## Authentication system with the AuthController

```php
<?php

namespace App\Http\Controllers;
use App\Models\User;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    // except the login api :)
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login']]);
    }

    public function login(Request $request){
        //validate form data
        $validator=Validator::make($request->all(),[
            'email'=>'required|email',
            'password'=>'required|min:6|string'
        ]);
        if($validator->fails()){
            return response()->json(['error'=>'Unauthorized'],400);
        }
        //setting token validity  
        $token_validity= 24*60;
        $this->guard()->factory()->setTTL($token_validity);
        // verify informations and 
        if (! $token = $this->guard()->attempt($validator->validated())) {
            //return error if no user match
            return response()->json(['error' => 'Unauthorized'], 401);
        }
        //return token if a user is found
        return $this->respondWithToken($token);

    }

    public function register(Request $request){
        //validate form data
        $validator=Validator::make($request->all(),[
            'name'=>'required|string',
            'email'=>'required|email',
            'password'=>'required|min:6|string'
        ]);
        if($validator->fails()){
            return response()->json([$validator->errors()],422);
        }
        //create user
        $user=User::create(array_merge(
            $validator->validated(),
            ['password'=>bcrypt($request->password)]
        ));
        //and send success message
        return response()->json(['message'=>'User created successfully','user'=>$user]);
    }

    public function logout(Request $request){
        //logout user
        return $this->guard()->logout();
        return response()->json(['message' => 'Successfully logged out']);
    }

    public function profile(Request $request){
        //see profile user informations
        return response()->json($this->guard()->user());
    }

    public function refresh(Request $request){
        // refresh and also change the token
        return $this->respondWithToken($this->guard()->refresh());
    }

    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => $this->guard()->factory()->getTTL() * 60
        ]);
    }

    protected function guard(){
        return Auth::guard();
    }
}

```

## API End Points

| Verb  | Url              | Actions                                           |
|-------|------------------|---------------------------------------------------|
| GET   | /api/todos       |Display all user's todolist:Todocontroller@index   |
| POST   | /api/todos       |Create new todo:Todocontroller@store   |
| GET   | /api/todos/{todo}       |Display a specific todo:Todocontroller@show   |
| PUT/PATCH   | /api/todos/{todos}       |Update a specific todo:Todocontroller@update   |
| DELETE   | /api/todos/{todos}       |Delete a specific todo:Todocontroller@destroy   |


