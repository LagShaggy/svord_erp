<script>
	import Form from '../Primitive/Form/Form.svelte'
	import InputText from '../Primitive/Form/InputText.svelte'
	import Submit from '../Primitive/Form/Submit.svelte'

	export let action = ''
</script>

<Form {action} className={'w-1/3 rounded-3xl'}>
	<h1>Login</h1>
	<InputText type={'email'} name={'email'}>Email</InputText>
	<InputText type={'password'} name={'password'}>Password</InputText>
	<Submit>Login</Submit>
</Form>
