import type { Actions, PageServerLoad } from './$types'

export const load: PageServerLoad = async ({ locals: { supabase } }) => {
	const { data: accounts, error } = await supabase.from('Account').select()
	if (error) {
		console.log(error)
	}
	return { accounts }
}

export const actions: Actions = {
	createARccount: ({ request }) => {
		console.log(request.formData())
	},
	createContact: ({ request }) => {
		console.log(request.formData())
	}
}
