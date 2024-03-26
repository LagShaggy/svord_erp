import { ROUTES } from "$lib/routes"
import { redirect, type Actions } from "@sveltejs/kit"

export const actions: Actions = {
	logout: async ( event ) => {
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