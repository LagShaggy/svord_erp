<script>
	import { supabase } from '$lib/supabaseClient'
	import AuthForm from './AuthForm.svelte'
	import { session } from '$lib/stores'
	import { goto } from '$app/navigation'

	let setStore = (res) => {
		session.set({
			loggedIn: true,
			data: res.session
		})
	}

	async function signIn(event) {
		let { email, password } = event.detail
		const { data, error } =
			await supabase.auth.signInWithPassword({
				email,
				password
			})

		if (!error) {
			setStore(data)
			goto('/')
		} else {
			console.log(error)
			alert(error)
		}
	}
	const doublepwmode = false
</script>

<AuthForm {doublepwmode} on:fire={signIn}>Login</AuthForm>

{JSON.stringify($session.data)}

<style>
</style>
