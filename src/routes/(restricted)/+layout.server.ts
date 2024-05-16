import type { Session } from '@supabase/supabase-js'
import type { LayoutServerLoad } from './$types'
import type { Profile } from '$src/lib/supabase/schema'

export const load: LayoutServerLoad = async ({ locals: { getSession, supabase } }) => {
	const getProfile = async (session: Session | undefined) => {
		if (!session) {
			return undefined
		}
		const { data: profileData, error: profileError } = await supabase
			.from('profile')
			.select()
			.eq('id', session.user.id)
			.single()
		if (profileError) {
			throw profileError
		}
		return profileData
	}

	const getProfilePicture = async (profile: Profile | undefined) => {
		if (!profile) {
			return undefined
		}
		if (profile?.avatar_url) {
			const { data: picUrl, error: picError } = await supabase.storage
				.from('images')
				.createSignedUrl(profile.avatar_url, 6000)

			if (picError) {
				throw picError
			}

			return picUrl?.signedUrl ?? undefined
		}
	}

	try {
		const profile = await getProfile((await getSession()) ?? undefined)
		const profilePicture = await getProfilePicture(profile)
		return { profile, profilePicture }
	} catch (e) {
		console.log(e)
	}
}
