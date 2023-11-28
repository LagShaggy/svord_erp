const AUTH_PATH = '/auth'

export const onAuthPage = (id: string | null) => {
	return id?.startsWith(AUTH_PATH)
}
