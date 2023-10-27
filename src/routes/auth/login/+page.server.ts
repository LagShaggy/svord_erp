import { session } from '$lib/Auth/authStores'
import { supabase } from '$lib/supabase/supabaseClient'
import { redirect } from '@sveltejs/kit'
import type { Actions } from './$types'
import { CLIENT } from '$lib/routes'

export const actions: Actions = {
	login: async ({ request }) => {
		const data = await request.formData()

		const email = data.get('email') as string
		const password = data.get('password') as string

		console.log(email, password)

		const loginReponse = await supabase.auth.signInWithPassword({
			email,
			password
		})

		if (loginReponse.error) {
			console.log(loginReponse.error)
			alert(loginReponse.error)
		} else {
			session.set({
				session: loginReponse.data.session,
				user: loginReponse.data.user
			})
			throw redirect(301, CLIENT.HOME)
		}
	}
}
