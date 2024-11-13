<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function select()
    {
        try {
            $users = User::select(
                'users.id',
                'users.name',
                'users.email',
                'users.role_id', // Añadir role_id a la selección
                'roles.name as role_name'
            )
                ->join('roles', 'users.role_id', '=', 'roles.id')
                ->get();

            return response()->json([
                'code' => 200,
                'data' => $users
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'code' => 500,
                'message' => $th->getMessage()
            ], 500);
        }
    }


    public function store(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required',
                'email' => 'required|email|unique:users',
                'password' => 'required|min:6',
                'role_id' => 'required|exists:roles,id'
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'code' => 422,
                    'errors' => $validator->errors()
                ], 422);
            }

            $userData = $request->all();
            $userData['password'] = Hash::make($request->password);

            $user = User::create($userData);

            return response()->json([
                'code' => 201,
                'message' => 'Usuario creado exitosamente',
                'data' => $user
            ], 201);
        } catch (\Throwable $th) {
            return response()->json([
                'code' => 500,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    public function show($id)
    {
        try {
            $user = User::select(
                'users.id',
                'users.name',
                'users.email',
                'users.role_id',
                'roles.name as role_name'
            )
                ->join('roles', 'users.role_id', '=', 'roles.id')
                ->where('users.id', $id)
                ->first();

            if (!$user) {
                return response()->json([
                    'code' => 404,
                    'message' => 'Usuario no encontrado'
                ], 404);
            }

            return response()->json([
                'code' => 200,
                'data' => $user
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'code' => 500,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $user = User::find($id);

            if (!$user) {
                return response()->json([
                    'code' => 404,
                    'message' => 'Usuario no encontrado'
                ], 404);
            }

            $validator = Validator::make($request->all(), [
                'name' => 'required',
                'email' => 'required|email|unique:users,email,' . $id,
                'role_id' => 'required|exists:roles,id',
                'password' => 'sometimes|min:6'
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'code' => 422,
                    'errors' => $validator->errors()
                ], 422);
            }

            $userData = $request->except('password');
            if ($request->filled('password')) {
                $userData['password'] = Hash::make($request->password);
            }

            $user->update($userData);

            return response()->json([
                'code' => 200,
                'message' => 'Usuario actualizado exitosamente',
                'data' => $user
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'code' => 500,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    public function find($id) // Añadir este método si no existe
    {
        try {
            $user = User::select(
                'users.id',
                'users.name',
                'users.email',
                'users.role_id',
                'roles.name as role_name'
            )
                ->join('roles', 'users.role_id', '=', 'roles.id')
                ->where('users.id', $id)
                ->first();

            if (!$user) {
                return response()->json([
                    'code' => 404,
                    'message' => 'Usuario no encontrado'
                ], 404);
            }

            return response()->json([
                'code' => 200,
                'data' => $user
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'code' => 500,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    public function destroy($id)
    {
        try {
            $user = User::find($id);

            if (!$user) {
                return response()->json([
                    'code' => 404,
                    'message' => 'Usuario no encontrado'
                ], 404);
            }

            $user->delete();

            return response()->json([
                'code' => 200,
                'message' => 'Usuario eliminado exitosamente'
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'code' => 500,
                'message' => $th->getMessage()
            ], 500);
        }
    }
}
