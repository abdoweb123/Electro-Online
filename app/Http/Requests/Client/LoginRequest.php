<?php

namespace App\Http\Requests\Client;

class LoginRequest extends BaseRequest
{
    public function rules()
    {
        return [
            'email' => 'required|string|exists:clients,email',
            'password' => 'required|string',
        ];
    }

    public function messages()
    {
        return [
            'email.exists' => __('trans.This Email is not registered before!')
        ];
    }

    protected function failedValidation(\Illuminate\Contracts\Validation\Validator $validator)
    {
        session()->flash('error', __('trans.This Email is not registered before!'));
        parent::failedValidation($validator);
    }

}
