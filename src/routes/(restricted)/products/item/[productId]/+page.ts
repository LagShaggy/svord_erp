import { getProductById } from '$src/lib/supabase/api/product'
import type { PageLoad } from './$types'

export const load: PageLoad = async ({ params: { productId }, parent }) => {
	const { supabase } = await parent()
	try {
		const product = await getProductById(supabase, productId)

		console.log(product)

		return { product }
	} catch (e) {
		console.log(e)
	}
}
