import type { Account, TypedSupabaseClient } from '../schema'

export const postAccount = async (
	supabase: TypedSupabaseClient,
	newAccount: Omit<Account, 'id'>
) => {
	const { data: account } = await supabase
		.from('Account')
		.insert([newAccount])
		.select()
		.throwOnError()

	return account
}
