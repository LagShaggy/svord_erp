import { redirect } from '@sveltejs/kit'
import type { Actions } from './$types'
import { ROUTES } from '$lib/routes'

export const actions: Actions = {
	login: async (event) => {
		const {
			request,
			locals: { supabase }
		} = event

		const formdata = await request.formData()

		const email = formdata.get('email') as string
		const password = formdata.get('password') as string

		const { error } = await supabase.auth.signInWithPassword({
			email,
			password
		})

		if (error) {
			return { message: 'Login failed.' }
		} else {
			console.log('auth successfull!')
			throw redirect(301, ROUTES.HOME)
		}
	}
}
