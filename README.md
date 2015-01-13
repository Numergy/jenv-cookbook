# jenv Cookbook | [![Build Status](https://travis-ci.org/Numergy/jenv-cookbook.svg)](https://travis-ci.org/Numergy/jenv-cookbook)

Manage installation for multiple Java versions via [jenv][jenv]. Also provides a set of lightweight resources and providers.

If you've used [rbenv][rbenv] or [pyenv][pyenv], this is a port of that concept for Java.

# Requirements

- `apt`
- `git`


## Attributes

#### jenv::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['jenv']['user']</tt></td>
    <td>String</td>
    <td>Default user</td>
    <td><tt>jenv</tt></td>
  </tr>
  <tr>
    <td><tt>['jenv']['user_home']</tt></td>
    <td>String</td>
    <td>User home</td>
    <td><tt>/home/jenv</tt></td>
  </tr>
  <tr>
    <td><tt>['jenv']['manage_home']</tt></td>
    <td>Boolean</td>
    <td>Manage home</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['jenv']['group']</tt></td>
    <td>String</td>
    <td>Group to used</td>
    <td><tt>jenv</tt></td>
  </tr>
  <tr>
    <td><tt>['jenv']['group_users']</tt></td>
    <td>Array</td>
    <td>User in the group</td>
    <td><tt>[]</tt></td>
  </tr>
  <tr>
    <td><tt>['jenv']['root_path']</tt></td>
    <td>String</td>
    <td>Path to install jenv</td>
    <td><tt>/opt/jenv</tt></td>
  </tr>
  <tr>
    <td><tt>['jenv']['create_profiled']</tt></td>
    <td>Boolean</td>
    <td>Create file in profile.d</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['jenv']['git_force_update']</tt></td>
    <td>Boolean</td>
    <td>Force update jenv git repository</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['jenv']['git_repository']</tt></td>
    <td>String</td>
    <td>Git repository for jenv</td>
    <td><tt>https://github.com/CHH/jenv.git</tt></td>
  </tr>
  <tr>
    <td><tt>['jenv']['git_reference']</tt></td>
    <td>String</td>
    <td>Git reference for the git repository</td>
    <td><tt>master</tt></td>
  </tr>
</table>

## Resources and providers

### jenv_install
This resource installs a specified version of Java.

#### Actions

<table>
  <thead>
    <tr>
      <th>Action</th>
      <th>Description</th>
      <th>Default</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>:install</td>
      <td>
        Build and install a Java version.
      </td>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

#### Attributes

<table>
  <thead>
    <tr>
      <th>Attribute</th>
      <th>Description</th>
      <th>Default Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>version</td>
      <td>
        <b>Name attribute:</b> the name of a Java version (e.g. `6`)
      </td>
      <td><code>nil</code></td>
    </tr>
    <tr>
      <td>user</td>
      <td>
        A users's isolated jenv installation on which to apply an action. The default value of <code>nil</code> denotes a system-wide jenv installation is being targeted. <b>Note:</b> if specified, the user must already exist.
      </td>
      <td><code>nil</code></td>
    </tr>
    <tr>
      <td>root_path</td>
      <td>
        The path prefix to jenv installation, for example:
        <code>/opt/jenv</code>.
      </td>
      <td><code>nil</code></td>
    </tr>
    <tr>
      <td>environment</td>
      <td>
        A hash of environment variables to set before running this command.
      </td>
      <td><code>nil</code></td>
    </tr>
  </tbody>
</table>

#### Examples

##### Install Java 6

```ruby
jenv_install '6' do
  action :install
end
```

```ruby
jenv_install '6'
```

**Note:** the install action is default, so the second example is a more common usage.


### jenv_script

This resource is a wrapper for the `script` resource which wraps the code block in an `jenv`-aware environment.
See the Opscode [script resource][script_resource] documentation for more details.

#### Actions

<table>
  <thead>
    <tr>
      <th>Action</th>
      <th>Description</th>
      <th>Default</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>run</td>
      <td>Run the script</td>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

#### Attributes

<table>
  <thead>
    <tr>
      <th>Attribute</th>
      <th>Description</th>
      <th>Default Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>name</td>
      <td>
        <b>Name attribute:</b> Name of the command to execute.
      </td>
      <td>name</td>
    </tr>
    <tr>
      <td>jenv_version</td>
      <td>
        A version of Java being managed by jenv.
      </td>
      <td><code>nil</code></td>
    </tr>
    <tr>
      <td>root_path</td>
      <td>
        The path prefix to jenv installation, for example:
        <code>/opt/jenv</code>.
      </td>
      <td><code>nil</code></td>
    </tr>
    <tr>
      <td>code</td>
      <td>
        Quoted script of code to execute or simply a path to a file to execute in jenv context.
      </td>
      <td><code>nil</code></td>
    </tr>
    <tr>
      <td>creates</td>
      <td>
        A file this command creates - if the file exists, the command will not be run.
      </td>
      <td><code>nil</code></td>
    </tr>
    <tr>
      <td>cwd</td>
      <td>
        Current working directory to run the command from.
      </td>
      <td><code>nil</code></td>
    </tr>
    <tr>
      <td>environment</td>
      <td>
        A hash of environment variables to set before running this command.
      </td>
      <td><code>nil</code></td>
    </tr>
    <tr>
      <td>group</td>
      <td>
        A group or group ID that we should change to before running this command.
      </td>
      <td><code>nil</code></td>
    </tr>
    <tr>
      <td>path</td>
      <td>
        An array of paths to use when searching for the command.
      </td>
      <td><code>nil</code>, uses system path</td>
    </tr>
    <tr>
      <td>returns</td>
      <td>
        The return value of the command (may be an array of accepted values) this resource raises an exception if the return value(s) do not match.
      </td>
      <td><code>0</code></td>
    </tr>
    <tr>
      <td>timeout</td>
      <td>
        How many seconds to let the command run before timing out.
      </td>
      <td><code>nil</code></td>
    </tr>
    <tr>
      <td>user</td>
      <td>
        A users's isolated jenv installation on which to apply an action. The default value of <code>nil</code> denotes a system-wide jenv installation is being targeted. <b>Note:</b> if specified, the user must already exist.
      </td>
      <td><code>nil</code></td>
    </tr>
    <tr>
      <td>umask</td>
      <td>
        Umask for files created by the command.
      </td>
      <td><code>nil</code></td>
    </tr>
  </tbody>
</table>

#### Examples

##### Reload cache by running command

```ruby
jenv_script 'HelloWorld' do
  jenv_version '6'
  user         'deploy'
  group        'deploy'
  cwd          '/opt/shared'
  code         'HelloWorld'
end
```



### jenv_global

This resource sets the global version of Java to be used in all shells.

#### Actions

<table>
  <thead>
    <tr>
      <th>Action</th>
      <th>Description</th>
      <th>Default</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>create</td>
      <td>
        Sets the global version of Java to be used in all shells.
      </td>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

#### Attributes

<table>
  <thead>
    <tr>
      <th>Attribute</th>
      <th>Description</th>
      <th>Default Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>jenv_version</td>
      <td>
        <b>Name attribute:</b> a version of Java being managed by jenv.
        <b>Note:</b> the version of Java must already be installed but not installed it automatically.
      </td>
      <td><code>nil</code></td>
    </tr>
    <tr>
      <td>user</td>
      <td>
        A users's isolated jenv installation on which to apply an action. The default value of <code>nil</code> denotes a system-wide jenv installation is being targeted.
        <b>Note:</b> if specified, the user must already exist.
      </td>
      <td><code>nil</code></td>
    </tr>
    <tr>
      <td>root_path</td>
      <td>
        The path prefix to jenv installation, for example:
        <code>/opt/jenv</code>.
      </td>
      <td><code>nil</code></td>
    </tr>
  </tbody>
</table>

#### Examples

##### Set Java 6 as global

```ruby
jenv_global "6"
```

##### Set system java version as global

```ruby
jenv_global 'system'
```

##### Set Java 7 as global for a user

```ruby
jenv_global '7' do
  user 'bamboo'
end
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Authors:

 - Pierre Rambaud (pierre.rambaud@numergy.com)


[script_resource]:  http://docs.opscode.com/resource_script.html
[rbenv]:            https://github.com/sstephenson/rbenv
[pyenv]:            https://github.com/yyuu/pyenv
[jenv]:             https://github.com/gcuisinier/jenv
