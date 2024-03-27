import { redirect } from '@sveltejs/kit'
import type { Actions } from './$types'
import { ROUTES } from '$lib/routes'

export const actions: Actions = {
	login: async ({ request, locals: { supabase } }) => {
		const formdata = await request.formData()

		const email = formdata.get('email') as string
		const password = formdata.get('password') as string

		const { error, data } = await supabase.auth.signInWithPassword({
			email,
			password
		})

		console.log(data)

		if (error) {
			return { success: false, message: 'Login failed.' }
		} else {
			console.log('auth successfull!')
			redirect(301, ROUTES.HOME)
		}
	}
}
