<script lang="ts">
	import { supabase } from '$lib/supabaseClient'
	import AuthForm from './AuthForm.svelte'
	import { pathPreviouslyOn, session } from './authStores'
	import { goto } from '$app/navigation'
	import type { AuthLoginProps } from './types'

	const signIn = async (event: CustomEvent<AuthLoginProps>): Promise<void> => {
		let { email, password } = event.detail
		const authReponse = await supabase.auth.signInWithPassword({
			email,
			password
		})

		if (authReponse.error) {
			console.log(authReponse.error)
			alert(authReponse.error)
		} else {
			session.set({
				session: authReponse.data.session,
				user: authReponse.data.user
			})
			if (!!$pathPreviouslyOn) {
				goto($pathPreviouslyOn)
			} else {
				goto('/')
			}
		}
	}
	const doublepwmode = false
</script>

<AuthForm on:fire={signIn}>Login</AuthForm>

<style>
</style>
