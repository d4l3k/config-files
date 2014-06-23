import XMonad
import XMonad.Config.Xfce
import qualified XMonad.StackSet                 as W
import qualified Data.Map                        as M
import           XMonad.Layout.NoBorders
import           System.Exit
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
myWorkspaces :: [String]
myWorkspaces = [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14" ]


myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $

    -- launch a terminal
    [ ((modMask .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

    -- launch gmrun
    , ((modMask,               xK_p     ), spawn "exe=`yeganesh -x -- -fn '-*-dejavu sans mono-medium-*-*-*-14-*-*-*-*-*-*-*'` && eval \"exec $exe\"")

    -- close focused window
    , ((modMask .|. shiftMask, xK_c     ), kill)

     -- Rotate through the available layout algorithms
    , ((modMask,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modMask .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modMask,               xK_n     ), refresh)

    -- Hide struts
    , ((modMask,               xK_b     ), sendMessage ToggleStruts)

    -- Move focus to the next window
    , ((modMask,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modMask,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modMask,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modMask,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modMask,               xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modMask .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modMask .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modMask,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modMask,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modMask,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modMask,               xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modMask,               xK_period), sendMessage (IncMasterN (-1)))

    -- Quit xmonad
    , ((modMask .|. shiftMask, xK_q     ), io exitSuccess)

    -- Restart xmonad
    , ((modMask,               xK_q     ), restart "xmonad" True)
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [ ((m .|. modMask, k), windows $ f i)
         | (i, k) <- zip (XMonad.workspaces conf) [xK_grave, xK_1, xK_2, xK_3, xK_4, xK_5, xK_6, xK_7, xK_8, xK_9, xK_0, xK_minus, xK_equal, xK_BackSpace]
    , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
    ]

myLayout = smartBorders $ layoutHook xfceConfig

main = xmonad xfceConfig {
	focusedBorderColor = "#00FF00",
	normalBorderColor =  "#000000",
    terminal = "xfce4-terminal",
    keys = myKeys,
    workspaces = myWorkspaces,
    layoutHook = myLayout,
    startupHook = setWMName "LG3D",
    handleEventHook = fullscreenEventHook <+> handleEventHook xfceConfig
}


