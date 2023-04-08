<script>
	import { supabase } from '$lib/supabaseClient'
	import AuthForm from './AuthForm.svelte'

	async function signIn(event) {
		let { email, password } = event.detail
		//alert('Child Submited:' + email + 'and' + password)
		const { data, error } =
			await supabase.auth.signInWithPassword({
				email,
				password
			})

		if (!error) {
			const { session, user } = data
			console.log(session, user)
		} else {
			console.log(error)
		}
	}

	const doublepwmode = false
</script>

<AuthForm {doublepwmode} on:fire={signIn}>Login</AuthForm>

<style>
</style>
