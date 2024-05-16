import {
	getAlternativeProducts,
	getComponents,
	getProductById
} from '$src/lib/supabase/api/product'
import { browserSupabase } from '$src/lib/supabase/supabaseClient'
import type { PageLoad } from './$types'

export const load: PageLoad = async ({ params: { productId } }) => {
	try {
		const product = await getProductById(browserSupabase, productId)
		const alternativeProducts = await getAlternativeProducts(browserSupabase, product.category!)
		const components = getComponents(browserSupabase, productId)
		return { product, components, alternativeProducts }
	} catch (e) {
		console.log(e)
	}
}
