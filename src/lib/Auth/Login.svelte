<script lang="ts">
	import { supabase } from '$src/lib/supabaseClient'
	import AuthForm from './AuthForm.svelte'
	import { session } from '$src/lib/stores'
	import { goto } from '$app/navigation'

	let setStore = (res: any) => {
		session.set({
			loggedIn: true,
			data: res.session
		})
	}

	async function signIn(event: any) {
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
