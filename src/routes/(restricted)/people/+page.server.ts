import type { PageServerLoad } from './$types'

export const load: PageServerLoad = async ({ locals: { prisma } }) => {
	const accounts = await prisma.account.findMany()
	return { accounts }
}
