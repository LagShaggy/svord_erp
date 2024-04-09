<script lang="ts">
	import { ACTIONS } from '$lib/routes'
	import Form from '../Primitive/Form/Form.svelte'
	import InputPassword from '../Primitive/Form/InputPassword.svelte'
	import InputEmail from '../Primitive/Form/InputEmail.svelte'

	import SubmitButton from '../Primitive/Form/SubmitButton.svelte'
</script>

<Form action={ACTIONS.AUTH.LOGIN} className={'w-1/3 rounded-3xl'}>
	<h1>Login</h1>
	<InputEmail name={'email'}>Email</InputEmail>
	<InputPassword name={'password'}>Password</InputPassword>
	<SubmitButton className={'mt-5'}>Login</SubmitButton>
</Form>
