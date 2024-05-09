import type { SupabaseClient } from '@supabase/supabase-js'
import type { Account } from '../schema'

export const postAccount = async (supabase: SupabaseClient, account: Partial<Account>) => {
	const { data, error } = await supabase.from('Account').insert([account]).select()
	console.log(error)
}
