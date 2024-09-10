import {
	getAlternativeProducts,
	getComponents,
	getProductById
} from '$src/lib/supabase/api/product'
import { browserSupabase } from '$src/lib/supabase/supabaseClient'
import type { PageLoad } from './$types'

export const load: PageLoad = async ({ params : {productId}}: { params: { productId: number } }) => {
	try {

		const product = await getProductById(browserSupabase, productId)
		const alternativeProductsPromise = getAlternativeProducts(browserSupabase, product.category)
		const componentsPromise = getComponents(browserSupabase, product.id)

		return { product, componentsPromise, alternativeProductsPromise }
	} catch (e) {
		console.log(e)
	}
}
