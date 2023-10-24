<script lang="ts">
	import { goto } from '$app/navigation'
	import Logout from '$lib/Auth/Logout.svelte'
	import { loggedIn } from '$lib/Auth/authStores'
	import DropdownPannel from '$lib/UI/Dropdown/DropdownPannel.svelte'
	import DropdownProvider from '$lib/UI/Dropdown/DropdownProvider.svelte'
	import { CLIENT } from '$lib/routes'

	const redirect = (path: string) => {
		goto(path)
	}
</script>

{#if $loggedIn}
	<DropdownProvider>
		<div class="w-10 h-10 rounded-full border-1 bg-cyan-200 overflow-hidden">
			<img src="/icons/user.svg" alt="Profile Picutre" class="w-full h-full object-cover" />
		</div>
		<DropdownPannel slot="pannel">
			<button on:click={() => goto(CLIENT.PROFILE)}>Profile</button>
			<Logout />
		</DropdownPannel>
	</DropdownProvider>
{/if}
