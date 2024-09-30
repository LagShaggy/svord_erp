import type { Actions } from './$types'
import { uploadAvatar } from '$src/lib/supabase/api/storage/uploadAvatar'
import type { Profile } from '$src/lib/supabase/schema'
import { updateProfile } from '$src/lib/supabase/api/profile'
import type { SvordFile } from '$src/lib/supabase/api/storage/uploader'

export const actions: Actions = {
	default: async ({ request, locals: { supabase, user } }) => {
		console.log('Action ')

		try {
			const formData = Object.fromEntries(await request.formData())
			const { file: avatarImg, ...updatedProfile } = formData as unknown as SvordFile<Profile>

			updatedProfile.id = user!.id

			if (avatarImg && avatarImg.size != 0) {
				await uploadAvatar(supabase, avatarImg, updatedProfile)
			} else {
				await updateProfile(supabase, updatedProfile)
			}
		} catch (e) {
			fail(401, { error: e })
		}
	}
}
