import { browserSupabase } from '../supabaseClient'

export const getImage = async (
	bucket: string,
	fileName: string,
	duration?: number
): Promise<string> => {
	if (!duration) {
		duration = 60
	}
	const { data: imgurl, error } = await browserSupabase.storage
		.from(bucket)
		.createSignedUrl(fileName, duration)

	if (error) {
		throw error
	}
	return imgurl.signedUrl
}
