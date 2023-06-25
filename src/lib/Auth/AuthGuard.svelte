<script lang="ts">
	import { goto } from '$app/navigation'
	import { pathPreviouslyOn, session, loggedIn } from '$lib/Auth/authStores'
	import { browser } from '$app/environment'
	import { redirect } from '@sveltejs/kit'
	import { page } from '$app/stores'

	const allowedPaths = ['/auth/']

	let onAuthPage: boolean = allowedPaths.some((path) => $page.url.pathname.includes(path))
	$: {
		onAuthPage = allowedPaths.some((path) => $page.url.pathname.includes(path))
		console.log('logged in:', $loggedIn, 'on Auth route:', onAuthPage)

		if (!$loggedIn && !onAuthPage) {
			pathPreviouslyOn.set($page.url.pathname)
			if (browser) {
				goto('/auth/login')
			} else {
				redirect(307, '/auth/login')
			}
		}
	}
</script>

{#if $loggedIn || onAuthPage}
	<slot />
{:else}
	<div class="flex items-center justify-center h-full w-full">
		<img src="$icons/svord-logo.svg" alt="Company Logo" />
	</div>
{/if}
