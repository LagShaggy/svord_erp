import { PUBLIC_SUPABASE_ANON_KEY, PUBLIC_SUPABASE_URL } from '$env/static/public'
import type { LayoutLoad } from './$types'
import { createBrowserClient, isBrowser, parse } from '@supabase/ssr'
import { PrismaClient } from '@prisma/client/edge'

export const load: LayoutLoad = async ({ fetch, data, depends }) => {
	depends('supabase:auth')
  
	const prisma = new PrismaClient()

	const supabase = createBrowserClient(PUBLIC_SUPABASE_URL, PUBLIC_SUPABASE_ANON_KEY, {
	  global: {
		fetch,
	  },
	  cookies: {
		get(key) {
		  if (!isBrowser()) {
			return JSON.stringify(data.session)
		  }
  
		  const cookie = parse(document.cookie)
		  return cookie[key]
		},
	  },
	})
  
	const { data: { session: sessionData } } = await supabase.auth.getSession()
	
	// console.log("BrowserClientData")
	// console.log(sessionData)
	// console.log("ServerClientData")
	// console.log(data)

	return { supabase, session: data.session, prisma }
  }
