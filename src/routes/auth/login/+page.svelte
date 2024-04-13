<script lang="ts">
	import Form from '$src/lib/UI/Primitive/Form/Form.svelte'
	import { ACTIONS } from '$src/lib/routes'
	import InputEmail from '$src/lib/UI/Primitive/Form/InputEmail.svelte'
	import { page } from '$app/stores'
	import InputPassword from '$src/lib/UI/Primitive/Form/InputPassword.svelte'
	import SubmitButton from '$src/lib/UI/Primitive/Form/SubmitButton.svelte'
</script>

<Form action={ACTIONS.AUTH.LOGIN} className={'w-1/3'}>
	<h1>Welcome back</h1>
	<InputEmail name={'email'} value={$page.form?.email}>Email</InputEmail>
	<InputPassword name={'password'}>Password</InputPassword>
	<SubmitButton className={'mt-5'}>Login</SubmitButton>
</Form>
