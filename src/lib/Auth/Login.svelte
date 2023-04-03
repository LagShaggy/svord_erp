<script>
	import { supabase } from '$lib/supabaseClient'
	import AuthForm from './AuthForm.svelte'

	async function signInWithEmail(event) {
		event.detai
		alert('Child Submited:' + email + 'and' + password)
		const { data, error } =
			await supabase.auth.signInWithPassword({
				email,
				password
			})
	}

	const doublepwmode = true
</script>

<AuthForm on:fire={signInWithEmail} doublepwmode
	>Login</AuthForm
>

<style>
</style>
