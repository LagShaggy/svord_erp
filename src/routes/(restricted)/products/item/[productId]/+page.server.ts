import { upload } from '$src/lib/supabase/storage/uploader'
import type { Actions } from '@sveltejs/kit'

export const actions: Actions = {
	uploadFile: () => {},
	uploadImage: async ({ request }) => {
		const formData = await request.formData()
		console.log(formData)
	}
}
