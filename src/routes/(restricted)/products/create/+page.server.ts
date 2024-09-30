import { fail, redirect } from '@sveltejs/kit'
import type { Actions } from './$types'
import type { Alert } from '$src/lib/UI/Alert/alert'
import { ROUTES } from '$src/lib/routes'
import type { Product } from '$src/lib/supabase/schema'

// export const load: PageServerLoad = async ({ locals: { supabase } }) => {
// 	const { data, error } = await supabase.from('Product_Category').select()
// 	console.log(data)
// 	if (error) {
// 		console.log(error)
// 	}
// 	return { categories: data }
// }

export const actions: Actions = {
	createProduct: async ({ request, locals: { supabase } }) => {
		const formData = await request.formData()

		const name = formData.get('name') as string
		const description = formData.get('description') as string
		const category = formData.get('product_category') as unknown as number

		if (!category || !name || !description) {
			fail(400, { name, category, description })
		}
		const product: Partial<Product> = {
			name,
			description,
			category
		}
		const { data, error } = await supabase
			.from('product')
			.insert({ ...product })
			.select()

		if (error) {
			console.log(error)
			const alert: Alert = {
				type: 'ERROR',
				title: 'Something went wrong',
				message: error.message
			}
			return fail(400, { alert, name, description, category })
		}
		redirect(301, ROUTES.PRODUCT.SINGLE + data[0].id)
	},

	createProductCategory: async ({ request, locals: { supabase } }) => {
		const formData = await request.formData()
		const categoryName = formData.get('newCategory') as string

		if (categoryName.trim() == '') {
			fail(400, { categoryName, error: { message: 'Category Name cant be an Empty String' } })
		}
		const { error } = await supabase
			.from('product_category')
			.insert([{ name: categoryName, colour_hex: '' }])
			.select()

		if (error) {
			console.log(error)
			return fail(400, { category: categoryName, error })
		}

		const alert: Alert = {
			title: 'Product Category Created',
			message: ``,
			type: 'OK'
		}
		return { alert }
	}
}
