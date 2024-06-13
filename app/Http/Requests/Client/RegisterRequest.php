<?php

namespace App\Http\Requests\Client;

class RegisterRequest extends BaseRequest
{
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'min:3'],
            'phone' => ['required', 'string', 'unique:clients,phone'],
            'email' => ['nullable', 'string', 'unique:clients,email'],
            'password' => ['required', 'string', 'confirmed'],
        ];
    }
}
