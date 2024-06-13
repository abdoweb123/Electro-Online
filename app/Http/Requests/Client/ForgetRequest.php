<?php

namespace App\Http\Requests\Client;

class ForgetRequest extends BaseRequest
{
    public function rules()
    {
        return [
            'email' => 'required|string|exists:clients,email',
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
