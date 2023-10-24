<script lang="ts">
	import { goto } from '$app/navigation'
	import { pathPreviouslyOn, session, loggedIn } from '$lib/Auth/authStores'
	import { browser } from '$app/environment'
	import { page } from '$app/stores'
	import svord_logo from '$icons/svord-logo.svg'

	// $: {
	// 	if (!$loggedIn) {
	// 		pathPreviouslyOn.set($page.url.pathname)
	// 		if (browser) {
	// 			console.log('redirecteding from authguard')
	// 			goto('/auth/login')
	// 		}
	// 	}
	// }
</script>

{#if $loggedIn}
	<slot />
{:else}
	<div class="flex items-center justify-center h-full w-full">
		<img src={svord_logo} alt="Company Logo" />
	</div>
{/if}
