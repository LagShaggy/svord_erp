import type { PageServerLoad } from './$types'

export const load: PageServerLoad = async ({ locals: { supabase } }) => {
	const { data: accounts, error } = await supabase.from('Account').select()
	if(error){
		console.log(error)
	}
	return { accounts }
}
