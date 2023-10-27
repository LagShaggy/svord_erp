<script lang="ts">
	import { goto } from '$app/navigation'
	import { loggedIn, session } from '$lib/Auth/authStores'
	import Button from '$lib/UI/Primitive/Button.svelte'
	import DropdownPannel from '$lib/UI/Dropdown/DropdownPannel.svelte'
	import DropdownProvider from '$lib/UI/Dropdown/DropdownProvider.svelte'
	import DropdownButton from '$lib/UI/Dropdown/DropdownButton.svelte'
	import { CLIENT } from '$lib/routes'

	const redirect = (path: string) => {
		goto(path)
	}
</script>

{#if $loggedIn}
	<DropdownProvider let:handleExpand let:expanded>
		<DropdownButton {handleExpand}>
			<div class="w-10 h-10 rounded-full border-1 bg-cyan-200 overflow-hidden">
				<img src="/icons/user.svg" alt="Profile Picutre" class="w-full h-full object-cover" />
			</div>
		</DropdownButton>
		<DropdownPannel {expanded}>
			<Button command={session.logout}>Logout</Button>
			<Button command={session.logout}>Logout</Button>
			<Button command={session.logout}>Logout</Button>
			<Button command={session.logout}>Logout</Button>
			<Button command={() => console.log('clicked')}>Click me</Button>
		</DropdownPannel>
	</DropdownProvider>
{/if}
