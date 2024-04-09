import { browserSupabase } from '$lib/supabase/supabaseClient'

export const upload = async (bucket: string, name: string, file: File) => {
	const { data, error } = await browserSupabase.storage.from(bucket).upload(name, file, {
		cacheControl: '3600',
		upsert: true
	})
	if (error) {
		return error
	}
	return data
}
