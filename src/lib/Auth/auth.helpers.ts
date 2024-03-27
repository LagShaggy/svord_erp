const AUTH_PATH = '/auth'
const LOGOUT_PATH = '/logout'

export const onAuthPage = (id: string | null) => {
	return id?.startsWith(AUTH_PATH) && !id.endsWith(LOGOUT_PATH)
}
