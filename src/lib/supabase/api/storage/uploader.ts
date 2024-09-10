import { v4 as uuidv4 } from 'uuid'
import type { TypedSupabaseClient } from '../../schema'

export enum Bucket {
	Images = 'images',
	ProductImages = 'productImages'
}

export type SvordFile<T> = {
	file: File
} & T

const imageNameGenerator = (): string => {
	return uuidv4()
}

/**
 * Uploads a file to the specified bucket (incl. subfolders), then returns the location of the file saved
 * @param bucket
 * @param file
 * @param name
 * @returns
 */
export const uploadToBucket = async (
	supabase: TypedSupabaseClient,
	options: {
		bucket: Bucket
		file: File
		upsert: boolean
		folderPrefix?: string | number
		name?: string | number
	}
) => {
	const { bucket, file, upsert, folderPrefix } = options
	let { name } = options

	if (!name) {
		name = imageNameGenerator()
	}
	if (folderPrefix) {
		name = `${folderPrefix}/${name}`
	}
	const { data: filePath, error } = await supabase.storage
		.from(bucket)
		.upload(name.toString(), file, {
			cacheControl: '3600',
			upsert
		})
	if (error) {
		throw error
	}

	console.log(filePath)

	return filePath.path
}
