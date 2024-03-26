import type { Actions, PageServerLoad } from './$types'

export const load: PageServerLoad = async () => {
	return {}
}

export const actions: Actions = {
	logout: async ({ locals: {supabase} }) => {
		console.log("Logout Action")
		//supabase.auth.signOut()
		// return {success: true, message: "Logout Successfull!"}
		//throw redirect(301, ROUTES.AUTH.LOGIN)
	}
}
