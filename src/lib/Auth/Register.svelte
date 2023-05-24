<script>
	import { supabase } from '$lib/supabaseClient'
	import AuthForm from './AuthForm.svelte'

	async function signUp(event) {
		let { email, password } = event.detail
		//alert('Child Submited:' + email + 'and' + password)
		const { data, error } = await supabase.auth.signUp({
			email,
			password
		})
		console.log(data, error)
	}
	const doublepwmode = false
</script>

<AuthForm {doublepwmode} on:fire={signUp}>
	Register
</AuthForm>
