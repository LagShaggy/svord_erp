import type { SupabaseClient } from '@supabase/supabase-js'
import type { Profile } from '../schema'
import type { Database } from '../database.types'

export const updateProfile = async (supabase: SupabaseClient<Database>, profile: Profile) => {
	const { id, ...profileData } = profile
	const { data, error } = await supabase
		.from('profile')
		.update({
			...profileData
		})
		.eq('id', id)
		.select()

	if (error) {
		throw error
	}
	return data
}
