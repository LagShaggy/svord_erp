<script lang="ts">
	import { ACTIONS } from '$lib/routes'
	import Form from '../Primitive/Form/Form.svelte'
	import InputText from '../Primitive/Form/InputText.svelte'
	import Submit from '../Primitive/Form/Submit.svelte'

	const action = ACTIONS.AUTH.LOGIN
</script>

<Form {action} className={'w-1/3 rounded-3xl'}>
	<h1>Login</h1>
	<InputText type={'email'} name={'email'}>Email</InputText>
	<InputText type={'password'} name={'password'}>Password</InputText>
	<Submit className={'mt-5'}>Login</Submit>
</Form>
