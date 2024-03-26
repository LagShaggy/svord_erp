import type { Actions } from './$types'
import { redirect } from '@sveltejs/kit'
import { ROUTES } from '$lib/routes'

export const actions: Actions = {
	default: async ({ locals: {supabase} }) => {
                console.log("Logout Action")
                //supabase.auth.signOut()
                // return {success: true, message: "Logout Successfull!"}
                //throw redirect(301, ROUTES.AUTH.LOGIN)
	}
}
