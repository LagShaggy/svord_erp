import { Country } from '$src/lib/Icons/Flags/countries.enum'
import { postAccount } from '$src/lib/supabase/api/account'
import type { Actions, PageServerLoad } from './$types'

export const load: PageServerLoad = async ({ locals: { supabase } }) => {
	const { data: accounts, error } = await supabase.from('Account').select()
	if (error) {
		console.log(error)
	}
	return { accounts }
}

export const actions: Actions = {
	createAccount: async ({ request, locals: { supabase } }) => {
		const data = await request.formData()
		const account = Object.fromEntries(data)
		postAccount(supabase, { country: Country.Anguilla, ...account })
	},
	createContact: async ({ request }) => {
		console.log(request.formData())
	}
}
