import type { TypedSupabaseClient } from '../schema'

const TABLE_NAME = 'country'

export const getCountries = async (supabase: TypedSupabaseClient) => {
	const { data: country, error } = await supabase.from(TABLE_NAME).select().throwOnError()
	if (error) {
		throw error
	}
	return country
}
