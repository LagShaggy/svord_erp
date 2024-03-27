<script lang="ts">
	import { ACTIONS } from '$lib/routes'
	import Form from '../Primitive/Form/Form.svelte'
	import InputText from '../Primitive/Form/InputText.svelte'
	import SubmitButton from '../Primitive/Form/SubmitButton.svelte'
</script>

<Form action={ACTIONS.AUTH.LOGIN} className={'w-1/3 rounded-3xl'}>
	<h1>Login</h1>
	<InputText type={'email'} name={'email'}>Email</InputText>
	<InputText type={'password'} name={'password'}>Password</InputText>
	<SubmitButton className={'mt-5'}>Login</SubmitButton>
</Form>
