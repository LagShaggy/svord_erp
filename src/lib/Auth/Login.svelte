<script>
	import { supabase } from '$lib/supabaseClient'
	import AuthForm from './AuthForm.svelte'
	import { session } from '$lib/stores'
	import { goto } from '$app/navigation'

	let setStores = (res) => {
		session.set({
			loggedIn: true,
			data: res.session
		})
	}

	async function signIn(event) {
		let { email, password } = event.detail
		//alert('Child Submited:' + email + 'and' + password)
		const { data, error } =
			await supabase.auth.signInWithPassword({
				email,
				password
			})

		if (!error) {
			setStores(data)
			goto('/')
		} else {
			alert(error)
		}
	}
	const doublepwmode = false
</script>

<AuthForm {doublepwmode} on:fire={signIn}>Login</AuthForm>

<style>
</style>
