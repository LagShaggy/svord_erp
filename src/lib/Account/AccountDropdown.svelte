<script lang="ts">
	import { goto } from '$app/navigation'
	import Button from '$lib/UI/Primitive/Button.svelte'
	import DropdownPannel from '$lib/UI/Dropdown/DropdownPannel.svelte'
	import DropdownProvider from '$lib/UI/Dropdown/DropdownProvider.svelte'
	import DropdownButton from '$lib/UI/Dropdown/DropdownButton.svelte'
	import { ROUTES } from '$lib/routes'
	import Link from '$lib/UI/Primitive/Link.svelte'
	import type { SupabaseClient } from '@supabase/supabase-js'
	import ClickableStyling from '$lib/UI/Primitive/Styling/ClickableStyling.svelte'
	import { supabase } from '$lib/supabase/supabaseClient'
	import LogoutForm from '$lib/UI/Forms/LogoutForm.svelte'

	const redirect = (path: string) => {
		goto(path)
	}
</script>

<DropdownProvider let:handleExpand let:expanded>
	<DropdownButton {handleExpand}>
		<div class="w-10 h-10 rounded-full border-1 bg-cyan-200 overflow-hidden">
			<img src="/icons/user.svg" alt="Profile Picutre" class="w-full h-full object-cover" />
		</div>
	</DropdownButton>
	<DropdownPannel {expanded} displaceCSS="top-10 right-10">
		<Link path={ROUTES.PROFILE}>Profile</Link>
		<Link path={ROUTES.ORG}>Organisation</Link>
		<LogoutForm />
		<Button command={() => console.log('clicked')}>Click me</Button>
		<DropdownProvider let:handleExpand let:expanded>
			<DropdownButton {handleExpand} />
		</DropdownProvider>
	</DropdownPannel>
</DropdownProvider>
