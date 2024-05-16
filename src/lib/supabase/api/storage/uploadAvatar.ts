import type { SupabaseClient } from '@supabase/supabase-js'
import { updateProfile } from '../profile'
import { Bucket, uploadToBucket } from './uploader'
import type { Database } from '../../supabase.types'
import type { Profile } from '../../schema'

export const uploadAvatar = async (
	supabase: SupabaseClient<Database>,
	file: File,
	profile: Profile
) => {
	if (file.size == 0) {
		return
	}
	console.log(profile)

	const objectData = await uploadToBucket(supabase, {
		bucket: Bucket.Images,
		file: file,
		upsert: true,
		name: 'avatars/' + profile.id!
	})

	const data = await updateProfile(supabase, { ...profile, avatar_url: objectData.name })

	return data
}
