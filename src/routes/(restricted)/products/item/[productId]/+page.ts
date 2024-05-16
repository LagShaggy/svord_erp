import { getProductById } from '$src/lib/supabase/api/product'
import { browserSupabase } from '$src/lib/supabase/supabaseClient'
import type { PageLoad } from './$types'

export const load: PageLoad = async ({ params: { productId } }) => {
	try {
		const product = await getProductById(browserSupabase, productId)

		console.log(product)

		return { product }
	} catch (e) {
		console.log(e)
	}
}
