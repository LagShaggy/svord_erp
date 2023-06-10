<script lang="ts">
	import '$src/app.css'
	import {
		Navbar,
		NavBrand,
		NavLi,
		NavUl,
		NavHamburger,
		Dropdown,
		DropdownItem,
		Chevron,
		Avatar,
		DropdownHeader,
		DropdownDivider
	} from 'flowbite-svelte'
	import Logout from '$lib/Auth/Logout.svelte'

	import { session } from '$src/lib/stores'
	import { goto } from '$app/navigation'
	import { browser } from '$app/environment'

	let loggedIn = false
	$: {
		loggedIn = $session.loggedIn
		if (!loggedIn) {
			console.log(
				'Authguard Logged In?',
				loggedIn,
				'To be redirected!'
			)
			if (browser) {
				goto('/auth/login')
			}
		}
	}
</script>

<Navbar
	class="sticky top-0 z-10 bg-slate-200 bg-opacity-90"
	let:hidden
	let:toggle
>
	<NavBrand href="/">
		<img
			src="/favicon.png"
			class="mr-3 h-6 sm:h-9"
			alt="SwimSuit Icon"
		/>
		<span
			class="self-center whitespace-nowrap font-oswald text-2xl font-semibold dark:text-white"
		>
			œderlin
		</span>
	</NavBrand>
	<div class="flex items-center md:order-2">
		<Avatar id="avatar-menu" src="user.svg" />
		<NavHamburger
			on:click={toggle}
			class1="w-full md:flex md:w-auto md:order-1"
		/>
	</div>
	<Dropdown placement="bottom" triggeredBy="#avatar-menu">
		<DropdownHeader>
			<span class="block text-sm">
				{'Bonnie Green'}
			</span>
			<span class="block truncate text-sm font-medium">
				{$session.data.user.email}
			</span>
		</DropdownHeader>
		<DropdownItem on:click={() => goto('/profile')}>
			Profile
		</DropdownItem>
		<DropdownItem on:click={() => goto('/settings')}>
			Settings
		</DropdownItem>
		<DropdownDivider />
		<Logout />
	</Dropdown>
	<NavUl {hidden}>
		<NavLi href="/products">Products</NavLi>

		<NavLi id="nav-menu1" class="cursor-pointer">
			<Chevron aligned>Orders</Chevron>
		</NavLi>
		<NavLi href="/users">Users</NavLi>
		<Dropdown triggeredBy="#nav-menu1" class="z-20 w-44">
			<DropdownItem href="/orders/create">
				Create
			</DropdownItem>
			<DropdownItem href="/orders/view">
				View All
			</DropdownItem>
		</Dropdown>
	</NavUl>
</Navbar>

<!--The pages get loaded here in <slot /> -->
<div
	class="mx-auto h-min bg-slate-300 py-6 px-8 pb-16 font-oswald shadow-xl"
>
	<slot />
</div>

<style>
</style>
