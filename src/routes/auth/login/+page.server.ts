import { redirect } from '@sveltejs/kit'
import type { Actions } from './$types'
import { ROUTES } from '$lib/routes'
import type { Alert } from '$src/lib/Alert/alert'

export const actions: Actions = {
	login: async ({ request, locals: { supabase } }) => {
		const formdata = await request.formData()

		const email = formdata.get('email') as string
		const password = formdata.get('password') as string

		const { error } = await supabase.auth.signInWithPassword({
			email,
			password
		})

		if (error) {
			const alert: Alert = {
				type: 'ERROR',
				title: 'AuthError',
				message: error.message
			}
			console.log(error)
			return { alert, email }
		} else {
			console.log('auth successfull!')
			const alertSuccess: Alert = {
				message: 'Welcome back.',
				title: 'Login',
				type: 'OK'
			}
			redirect(301, ROUTES.HOME)
		}
	}
}
